def frange(self,x, y, jump):
	"""The same as range but for floating-point numbers.
	
		Args:
			x: start range from
			y: end range to y
			jump: step size
		
		Returns:
			A sequence from x to y with step size jump.
	"""
		while x < y:
			yield x
			x += jump	
