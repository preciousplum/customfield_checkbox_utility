module CustomfieldCheckboxUtility
  module ListPatch
    
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :check_box_edit_tag, :checkall
      end
    end
    
    module InstanceMethods

      def check_box_edit_support(view, tag_name, options)
        view.content_tag('a',
          view.content_tag('span',
            l(options["label"]),
            :class => 'icon ' + options["icon"], :style => "margin-right: 4px;"),
          :href => 'javascript:void(0);', :onclick => 'javascript:' + options["method"] +'("' + tag_name + '");')
      end


      def check_box_edit_tag_with_checkall(view, tag_id, tag_name, custom_value, options={})
        top = ''.html_safe

        if custom_value.custom_field.multiple?
          tags = ''.html_safe

          checktags = check_box_edit_support(view, tag_name, { "label" => :label_check_all,    "icon" => 'icon-ok',        "method" => "cfcbCheckAll" })
          checktags += check_box_edit_support(view, tag_name, { "label" => :label_uncheck_all,  "icon" => 'icon-not-ok',    "method" => "cfcbUncheckAll" })
          if options[:class] == "user_cf"
            groups = custom_value.customized.project.groups
            groupdata = [{:groupname => "<< #{l(:label_me)} >>", :userids => User.current.id.to_s}]
            
            groups.each do |group|
              userids = group.users.map {|u| [u.id.to_s]}
              groupdata << {:groupname => group.name, :userids => userids.join(",")}
            end

            optiontags = ''.html_safe
            groupdata.each do |group|
              optiontags += view.content_tag('option', group[:groupname], :value => group[:userids])
            end
            selecttag = " (".html_safe + l(:label_group).html_safe + ": ".html_safe
            selecttag += view.content_tag('select', optiontags, :style => "width: 15em", :name => 'group_' + tag_name, :id => 'group_' + tag_name,
                                          :onchange => 'javascript:cfcbGroupChanged("' + tag_name + '");') + " "

            selecttag += check_box_edit_support(view, tag_name, { "label" => :label_check,    "icon" => 'icon-ok',        "method" => "cfcbCheckGroupAll" })
            selecttag += check_box_edit_support(view, tag_name, { "label" => :label_uncheck,  "icon" => 'icon-not-ok',    "method" => "cfcbUncheckGroupAll" })

            selecttag += ")".html_safe
            checktags += view.content_tag('span', selecttag, :class => 'cf_check_box_support') + "\n".html_safe
          end
          tags += view.content_tag('span', checktags, :class => 'cf_check_box_support') + "\n".html_safe 

          filtertag = l(:button_filter).html_safe + ": ".html_safe
          filtertag += view.content_tag('input', nil,
                       :size => 15, :value => '', :type => 'text', :name => 'filter_' + tag_name, :id => 'filter_' + tag_name,
                       :class => 'autocomplete', :onKeyUp => 'javascript:cfcbFilter("' + tag_name + '");') + " ("
          filtertag += check_box_edit_support(view, tag_name, { "label" => :label_show_all,     "icon" => 'icon-zoom-in',   "method" => "cfcbShowAll" })
          filtertag += check_box_edit_support(view, tag_name, { "label" => :label_show_checked, "icon" => 'icon-zoom-out',  "method" => "cfcbShowChecked" }) + ")"
          tags += view.content_tag('span', filtertag, :class => 'cf_check_box_support') + "\n".html_safe 

          top += tags + "\n".html_safe 
        end

        top += check_box_edit_tag_without_checkall(view, tag_id, tag_name, custom_value, options)
        
        if options[:class] == "user_cf"
          top += view.javascript_tag('cfcbGroupChanged("' + tag_name + '");')
        end
        top
      end
    end
  end
end
