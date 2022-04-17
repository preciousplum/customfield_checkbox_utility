require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'view_hooks'
end

Rails.configuration.to_prepare do
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
  description 'This plugin is to improve the usability for Custom Fields of "User" and "List" Format. '
  version '0.0.2'
  url 'https://github.com/preciousplum/customfield_checkbox_utility'
  author_url 'https://github.com/preciousplum/'
end
