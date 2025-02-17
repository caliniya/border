extends Area2D

var 自身阵营
var 敌人列表 = []
var 自身类型
var 类型

func _ready() -> void:
	自身阵营 = get_parent().自身阵营
	自身类型 = get_parent().自身类型
	类型 = get_parent().类型
		
func  单位进入(area:Area2D) -> void:
	if area.自身阵营 == 自身阵营 and area.自身类型 == 类型.子弹:
		pass
	else :
		敌人列表.append(area)
		area.被发现 = true
		pass
		
func  单位离开(area:Area2D) -> void:
	if area.自身阵营 == 自身阵营 and area.自身类型 == 类型.子弹:
		pass
	else :
		area.被发现 = false
		敌人列表.erase(area)
