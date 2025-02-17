extends Area2D

var 自身阵营
var 敌人列表 = []
@export var 子弹 = load("res://子弹/子弹原型.tscn")
var 目标选择计时器 = 0
var 目标距离列表 = []
var 目标距离 = 325
var 敌人距离
var 目标 : Area2D
var 目标方向
var 目标方向角度
var 目标方向差值
var 旋转角度
var 旋转速度

func _ready() -> void:
	自身阵营 = get_parent().自身阵营

func _process(delta: float) -> void:
	目标选择计时器 += delta
	if 目标 != null:
		转向(delta)

func  单位进入(area:Area2D) -> void:
	if area.自身阵营 == 自身阵营:
		pass
	else :
		敌人列表.append(area)
		if 目标选择计时器 > 10:
			目标选择()

func  单位离开(area:Area2D) -> void:
	if area.自身阵营 == 自身阵营:
		pass
	else :
		敌人列表.erase(area)

func  目标选择() -> void:
	for Area2D in 敌人列表:
		敌人距离 =  position.distance_to(Area2D.position)
		if 敌人距离 < 目标距离:
			目标距离 = 敌人距离
			目标 = Area2D
	目标选择计时器 = 0
	目标距离 = 325

func 转向(delta: float) -> void:
	var 目标方向 = (目标.position - position).normalized()
	var 目标角度 = 目标方向.angle()
	var 当前角度 = get_parent().rotation
	var 角度差值 = (目标角度 - 当前角度 + PI) % (2 * PI) - PI
	get_parent().rotation += 角度差值 * 旋转速度 * delta
