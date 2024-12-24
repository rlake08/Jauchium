extends BaseParticle


var current_electrons_in_zone: int = 0


func _on_hit_particle(particle: BaseParticle) -> void:
	if particle.charge == -1:
		current_electrons_in_zone += 1
		var direction_to_particle = global_position.direction_to(particle.global_position)
		goal_direction = -direction_to_particle

func _on_particle_left_collision(particle_that_left: BaseParticle) -> void:
	if particle_that_left.charge == -1:
		current_electrons_in_zone -= 1

func _on_update_particle() -> void:
	speed=OriginSpeed*clamp(current_electrons_in_zone,1,100)
