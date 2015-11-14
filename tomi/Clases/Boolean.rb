module Boolean

	False = []
	class << False
		def or other
			other
		end
		alias | or

		def and other
			self
		end
		alias & and

		def not
			True
		end
		alias ! not

		def to_s
			"False"
		end
		alias inspect to_s

	end

	True = []
	class << True
		def or other
			self
		end
		alias | or
			
		def and other
			other
		end
		alias & and

		def not
			False
		end
		alias ! not

		def to_s
			"True"
		end
		alias inspect to_s

	end
end
