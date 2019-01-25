require 'grapple'
require 'my_static_table_builder'
require 'my_ajax_table_builder'
require 'my_history_table_builder'

module ActiveRecord
	class Relation
	  alias_method :total_count, :count
	end
  end 