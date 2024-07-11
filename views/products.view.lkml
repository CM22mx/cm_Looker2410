view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    group_label: "Branding"
    type: string
    #case_sensitive: no
    #drill_fields: [inventory_item.cost]
    sql: ${TABLE}.brand ;;
  }
  parameter: brand_filter_test {
    type: string
    allowed_value: {
      label: "Allegra K"
      value: "Allegra K"
    }
    allowed_value: {
      label: "Calvin Klein"
      value: "Calvin Klein"
    }
    allowed_value: {
      label: "Kiran"
      value: "1"
    }
  }
  dimension: brand_test {
    sql: {% if brand_filter_test._parameter_value == "'1'" %}
    '1'
    {% else %}
    ${brand}
    {% endif %};;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count, sku, rank, brand,
      department, category, order_item.phone, orders.status, orders.user_id,
      users.age, users.city, users.Country]
  }
}
