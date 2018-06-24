module CustomfieldCheckboxUtility
  class Hooks < Redmine::Hook::ViewListener
      render_on :view_issues_form_details_top,
                :partial => 'issuesFormDetailsTop'
      render_on :view_custom_fields_form_upper_box,
                :partial => 'customFieldsFormUpperBox'
  end
end
