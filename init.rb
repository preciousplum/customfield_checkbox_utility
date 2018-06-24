require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'view_hooks'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'project'

  unless Redmine::FieldFormat::List.included_modules.include? CustomfieldCheckboxUtility::ListPatch
    Redmine::FieldFormat::List.send :include, CustomfieldCheckboxUtility::ListPatch
  end
  unless Project.included_modules.include? CustomfieldCheckboxUtility::ProjectPatch
    Project.send :include, CustomfieldCheckboxUtility::ProjectPatch
  end
end

Redmine::Plugin.register :customfield_checkbox_utility do
  name 'Customfield Checkbox Utility plugin'
  author 'preciousplum'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/preciousplum/checkbox_checkall'
  author_url 'https://github.com/preciousplum/'
end
