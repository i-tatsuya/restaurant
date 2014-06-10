module ApplicationHelper

  def page_title
    title = "MontBlanc"
    title = @page_title + " -" + title if @page_title
    return title
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("fields_" + association.to_s.singularize, :f => builder)
    end
    link_to_function(name, raw("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def course_image_tag(course, options={})
    if course.image.present?
      path = course_path(course, format: course.image.extenstion(course.image.content_type))
      image_tag(path, { alt: course.course_name }.merge(options))
    else
      ""
    end
  end
end
