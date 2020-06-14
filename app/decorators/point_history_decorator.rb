# frozen_string_literal: true

module PointHistoryDecorator
  def name
    if point_get_history
      case point_get_history.get_type
      when PointGetHistory::Type::VISIT then
        return "来店ポイント"
      when PointGetHistory::Type::BUY then
        return "購入ポイント"
      when PointGetHistory::Type::WALK then
        return "歩数ポイント"
      end
    else
      return point_use_history.product.name
    end
    # ここに来ることは通常考えられない
    ""
  end

  def changed_point
    if point_get_history
      point_get_history.get_point
    else
      - point_use_history.use_point
    end
  end

  def history_type_string
    point_get_history ? "get" : "use"
  end
end
