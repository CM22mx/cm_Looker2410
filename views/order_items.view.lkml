view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: user_id {
    sql: ${id} ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;

  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension: get_in_touch {
   # sql: "https://example.com" ;;

    html: <a href="{{rendered_value}}" target="_blank" rel="noopener noreferrer">　Get in touch　</a> ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    html:  {% assign pop_val = sale_price._value %}
    {% if pop_val > 0 %}
    <div style='display: inline-block;'>
    <p style='color: #53b94e; font-size:100%;'>{{ sale_price._rendered_value }}</p>
    </div>
    {% elsif pop_val < 0 %}
    <div style='display: inline-block;'>
    <p style='color: #d84555; font-size:100%;'>{{ sale_price._rendered_value }}</p>
    </div>
    {% else %}
    <div style='display: inline-block;'>
    <p style='font-size:100%;'>{{ sale_price._rendered_value }}</p>
    </div>
    {% endif %} ;;
    value_format: "$#.00,\" K\""
  }
  dimension: now {
    type: string
    sql: SUBSTR(NOW(),1,10) ;;
  }
  dimension: sale_pricetest {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format: "$0"
    }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
