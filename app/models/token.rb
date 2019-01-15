require 'securerandom'
require 'time'
class Token < ApplicationRecord

	attr_accessor :free_pool, :assigned_pool, :uid, :created_at

	def initialize

		@uid = SecureRandom.uuid
		@created_at = Time.now()
		@free_pool = []
		@assigned_pool = []

	end

	def generate(token)
		#puts @free_pool=[1]
		# token = Token.new
		token.free_pool.push(token)
		puts token.free_pool
		puts token.uid
		token
	end

	def assign
		
		assigned_pool << free_pool[random_index(free_pool.length)]

	end

	def unblock(index = nil)

		index = get_index(index,assigned_pool.length)
		free_pool << assigned_pool[index]
		assigned_pool.delete_at(index)

	end

	def delete(index = nil)

		index = get_index(index,free_pool.length)
		free_pool.delete_at(get_index(index))

	end

	private

	def random_index(pool_length)
		SecureRandom.random_number pool_length
	end

	def get_index(index,pool_length)
		index ? index : random_index(pool_length)
	end

end
