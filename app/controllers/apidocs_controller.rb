class ApidocsController < ApplicationController
    include Swagger::Blocks
  
    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Swagger Articles'
        key :description, 'A sample API to ' \
                          'demonstrate features in the swagger-2.0 specification'
        key :termsOfService, 'http://helloreverb.com/terms/'
        contact do
          key :name, 'Wordnik API Team'
        end
        license do
          key :name, 'MIT'
        end
      end
      key :host, 'hostname.com'
      key :basePath, '/api'
      key :consumes, ['application/json']
      key :produces, ['application/json']
    end
  
    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      ArticlesController,
      Article,
      self,
    ].freeze
  
    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end 