module ProgressBar
  module Format
    class Molecule
      MOLECULES = {
        :t => [:left_justified_title,               :title],
        :T => [:right_justified_title,              :title],
        :c => [:current_progress,                   :progress],
        :C => [:total_capacity,                     :total],
        :p => [:percentage_complete_as_integer,     :percentage],
        :P => [:percentage_complete_as_float,       :percentage_with_precision],
        :a => [:elapsed_time,                       :elapsed_time],
        :e => [:estimated_time_with_unknown,        :estimated_time_with_unknown_oob],
        :E => [:estimated_time_with_greater_than,   :estimated_time_with_friendly_oob],
        :f => [:force_estimated_time,               :estimated_time_with_no_oob],
        :b => [:bar,                                :bar],
        :B => [:bar_with_percentage,                :bar_with_percentage],
        :m => [:mirrored_bar,                       :mirrored_bar]
        # :mirrored_bar_with_percentage     => '%R'
      }

      BAR_MOLECULES     = %w{b B m}

      attr_reader   :key
      attr_reader   :method_name
      attr_reader   :method_arguments

      def initialize(letter)
        @key                                          = letter
        @description, @method_name, @method_arguments = MOLECULES[@key.to_sym]
      end

      def bar_molecule?
        BAR_MOLECULES.include? @key
      end
    end
  end
end
