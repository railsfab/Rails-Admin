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
        label = "<label for='#{html_id}'><input type='checkbox' id='cb_#{html_id}'  class='cb-enable-field' name='enabled_fields[#{column_name}]' /><span class='label-text'>#{label_name}</span></label>"

        if [:string, :integer, :date, :datetime, :time, :float, :decimal, :timestamp, :binary].include? column_type
            "#{label}<input type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{column_name}' />"
        elsif column_type == :text
            "#{label}<textarea type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' ></textarea>"
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

        if [:string, :integer, :date, :datetime, :time, :float, :decimal, :timestamp, :binary].include? column_type
            "#{label}<input type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' placeholder='#{column_name}' value='#{instance.read_attribute(column_name)}' />"
        elsif column_type == :text
            "#{label}<textarea type='text' id='#{html_id}' name='#{html_name}' class='#{get_field_class(column)}' >#{instance.read_attribute(column_name)}</textarea>"
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
