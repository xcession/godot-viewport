extends Sprite


# Get sizes of bounds and image
onready var parentViewportWidth: float = get_viewport().size.x
var iconWidth: float = self.get_texture().get_width()

# Movement speed
var speed: float = 150.0

# States for movement
enum MoveState {
	MOVE_LEFT,
	MOVE_RIGHT,
}
var state: int = MoveState.MOVE_RIGHT


func _physics_process(delta: float) -> void:
	if self.position.x + iconWidth >= parentViewportWidth:
		state = MoveState.MOVE_LEFT
	if self.position.x <= 0:
		state = MoveState.MOVE_RIGHT
	movement(delta)


func movement(deltaValue: float) -> void:
	if state == MoveState.MOVE_RIGHT:
		self.position.x += deltaValue * speed
	if state == MoveState.MOVE_LEFT:
		self.position.x -= deltaValue * speed

