module CustomfieldCheckboxUtility
  module ProjectPatch
    
    def self.included(base)
      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods
      def groups
        @groups ||= Group.active.joins(:members).where("#{Member.table_name}.project_id = ?", id).distinct
      end
    end
  end
end
