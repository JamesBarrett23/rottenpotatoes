module MoviesHelper
  def sortable_column_link(label, column)
    active = @sort_column == column
    direction = active && @sort_direction == "asc" ? "desc" : "asc"
    sort_direction = @sort_direction == "asc" ? "ascending" : "descending"
    indicator = @sort_direction == "asc" ? "▲" : "▼"
    content = [label]

    if active
      content << content_tag(:span, indicator, class: "sort-indicator", aria: { hidden: true })
      content << content_tag(:span, "Sorted #{sort_direction}", class: "visually-hidden")
    end

    link_to safe_join(content, " "), movies_path(sort: column, direction: direction), class: "sort-link"
  end

  def sort_column_class(column)
    return "sort-column" unless @sort_column == column

    "sort-column sort-#{@sort_direction}"
  end
end
