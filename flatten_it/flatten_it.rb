class Array
  def flatten_it
    def flattener( object, accumulator )
      if object.kind_of?( Array )
        object.each { | element | flattener( element, accumulator ) }
      else
        accumulator << object
      end
    end
    
    # make sure our accumulator is of the same class as we are.
    # don't want to change the class of possible subtypes.
    accumulator = self.class.new
    flattener( self, accumulator )
    return accumulator
  end
end
