constant: dynamic_comparison {

  value:
  "
  {% if period._is_selected %}
  <p style='font-size:100%;'>{{ rendered_value }}</p>
  {% else %}
  {% assign pop_val = metric_pop._value %}
  {% if pop_val > 0  %}
  <div style='display: inline-block;'>
  <p style='color: #53b94e; font-size:100%;'>{{ metric_pop._rendered_value }}</p>
  </div>
  {% elsif pop_val < 0 %}
  <div style='display: inline-block;'>
  <p style='color: #d84555; font-size:100%;'>{{ metric_pop._rendered_value }}</p>
  </div>
  {% else %}
  <div style='display: inline-block;'>
  <p style='font-size:100%;'>{{ metric_pop._rendered_value }}</p>
  </div>
  {% endif %}
  {% endif %}
  "
}
