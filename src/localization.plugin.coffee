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
            
            templateData.loc = (resources, document) ->
                document ?= @getDocument()
                if resources instanceof Array
                    localization = []
                    for res in resources
                        resource = config[res]
                        if resource?
                            if document.domain?
                                localization.push resource[document.domain.code.split('-')[0]]
                            else if document.get('domain')?
                                localization.push resource[document.get('domain').code.split('-')[0]]
                else
                    localization = ''
                    res = resources
                    resource = config[res]
                    if resource?
                        if document.domain?
                            localization = resource[document.domain.code.split('-')[0]]
                        else if document.get('domain')?
                            localization = resource[document.get('domain').code.split('-')[0]]
                localization
            @
