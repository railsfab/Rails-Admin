module RailsfabAdmin
  module AdminHelper
    def get_html_field(model, column)
        column_name = column.name
        if column_name == "id"
            return ""
        end
        model_name = model.to_s.downcase
        column_type = column.type
        html_name = "#{model_name}[#{column_name}]"
        html_id = "#{model_name}_#{column_name}"
        label_name = column_name.split("_").map{|i| i.capitalize }.join(" ")
        label = "<label for='#{html_id}'><input type='checkbox' id='cb_#{html_id}'  class='cb-enable-field' checked name='enabled_fields[#{column_name}]' /><span class='label-text'>#{label_name}</span></label>"
        foreign_keys_hash = {}
        foreign_keys = model.reflect_on_all_associations.select{
            |mac| mac.macro == :belongs_to 
        }.map{ 
            |i|
            foreign_keys_hash[i.foreign_key] = i.class_name
            i.foreign_key
        }


        if column_type == :integer
            if foreign_keys.include? column_name
                label = "<label for='#{html_id}'><input type='checkbox' id='cb_#{html_id}' class='cb-enable-field'  name='enabled_fields[#{column_name}]' /><span class='label-text'>#{foreign_keys_hash[column_name].capitalize}</span></label>"
                foreign_objects = foreign_keys_hash[column_name].classify.constantize.all
                html_options = foreign_objects.map{ |i| "<option value='#{i.id}'>#{i}</option>" }.join("")
                "#{label}<select name='#{html_name}' id='#{html_id}' class='#{get_field_class(column)}'>#{html_options}</select>"
            else
                "#{label}<input type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{label_name}' />"
            end
        elsif [:string, :date, :datetime, :time, :float, :decimal, :timestamp, :binary].include? column_type
            "#{label}<input type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{label_name}' />"
        elsif column_type == :text
            "#{label}<textarea type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{label_name}' ></textarea>"
        elsif column_type == :boolean
            "#{label}<input type='checkbox' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column_name)}' />"
        end
    end

    def get_html_field_value(model, instance, column)
        column_name = column.name
        if column_name == "id"
            return ""
        end
        model_name = model.to_s.downcase
        column_type = column.type
        html_name = "#{model_name}[#{column_name}]"
        html_id = "#{model_name}_#{column_name}"
        label_name = column_name.split("_").map{|i| i.capitalize }.join(" ")
        label = "<label for='#{html_id}'><input type='checkbox' id='cb_#{html_id}' class='cb-enable-field'  name='enabled_fields[#{column_name}]' /><span class='label-text'>#{label_name}</span></label>"
        foreign_keys_hash = {}
        foreign_keys = model.reflect_on_all_associations.select{
            |mac| mac.macro == :belongs_to 
        }.map{ 
            |i|
            foreign_keys_hash[i.foreign_key] = i.class_name
            i.foreign_key
        }

        if column_type == :integer
            if foreign_keys.include? column_name
                label = "<label for='#{html_id}'><input type='checkbox' id='cb_#{html_id}' class='cb-enable-field'  name='enabled_fields[#{column_name}]' /><span class='label-text'>#{foreign_keys_hash[column_name].capitalize}</span></label>"
                foreign_objects = foreign_keys_hash[column_name].classify.constantize.all
                html_options = foreign_objects.map{ |i| "<option value='#{i.id}'>#{i}</option>" }.join("")
                "#{label}<select name='#{html_name}' id='#{html_id}' data-val='#{instance.read_attribute(column_name)}' class='edit-select #{get_field_class(column)}'>#{html_options}</select>"
            else
                "#{label}<input type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{label_name}' />"
            end
        elsif [:string, :date, :datetime, :time, :float, :decimal, :timestamp, :binary].include? column_type
            "#{label}<input type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{label_name}' value='#{instance.read_attribute(column_name)}' />"
        elsif column_type == :text
            "#{label}<textarea type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{label_name}' >#{instance.read_attribute(column_name)}</textarea>"
        elsif column_type == :boolean
            "#{label}<input type='checkbox' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column_name)}' />"
        end
    end


    def get_field_class(column)
        classes = "form-control "
        column_type = column.type
        if column_type == :date
            classes += "date "
        elsif column_type == :datetime
            classes += "datetime "
        elsif column_type == :time
            classes += "time"
        end
        classes
    end

  end
end
