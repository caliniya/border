# 战舰主体脚本（附加到战舰Area2D）
extends Area2D

# 阵营枚举（根据需求扩展）
enum 阵营 {蓝队 , 红队, 黄队}
enum 类型 {战舰 , 战斗机 , 子弹}

@export var 自身阵营 = 阵营.蓝队
@export var 血量 := 1000
@export var 自身类型 := 类型.战舰
@export var 被锁定 := false

func  _process(delta: float) -> void:
	if 被锁定 == true:
		pass
