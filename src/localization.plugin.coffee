module.exports = (BasePlugin) ->
    # Define Plugin
    class Localization extends BasePlugin
        # Plugin Name
        name: 'localization'

        extendTemplateData: (opts) ->
            # Prepare
            docpad = @docpad
            config = @getConfig()
            {templateData} = opts
            
            templateData.loc = (res, document) ->
                document ?= @getDocument()
                localization = ''
                resource = config[res]
                if document.get('domain')? and resource?
                    localization = resource[document.get('domain').code]
                localization
            @
