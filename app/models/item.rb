class Item < ActiveRecord::Base
	belongs_to :list

	validates_presence_of :name

	before_save :update_date

	def find_list
		List.find(self.list_id)
	end

	private

	def update_date
		self.completed_date = Time.now if self.completed == true && self.completed_date.nil?
		self.completed_date = nil unless self.completed == true || self.completed_date.nil?
	end
end
