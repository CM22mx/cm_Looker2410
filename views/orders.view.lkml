view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: period {
    sql: ${created_date} ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
  }

   measure: count_test {
    type: sum
    sql: ${user_id} ;;
    html:
    {% assign metric_cp = m_publisher_net_revenue_est_pop_cp %}
    {% assign metric_pp = m_publisher_net_revenue_est_pop_pp %}
    {% assign metric_pop = m_publisher_net_revenue_est_pop %}
    {% assign metric_default = m_publisher_net_revenue_est %}
    @{dynamic_comparison};;
  }

  measure: m_publisher_net_revenue_est_pop_cp {
    type: sum
    sql: ${user_id} ;;
  }

  measure: m_publisher_net_revenue_est_pop_pp {
    type: sum
    sql: ${user_id} ;;
  }

  measure: m_publisher_net_revenue_est_pop {
    type: sum
    sql: ${user_id} ;;
  }

  measure: m_publisher_net_revenue_est {
    type: sum
    sql: ${user_id} ;;
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
