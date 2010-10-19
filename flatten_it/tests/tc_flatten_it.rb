require "flatten_it"
require "test/unit"

class MyArray < Array
end

class TestFlattenIt < Test::Unit::TestCase  
  def test_flattens_single_level_multidimensional_array
    initial = [ 1, 2, [ 3, 4], 5 ]
    expected = [ 1, 2, 3, 4, 5 ]
    assert_equal( expected, initial.flatten_it )
    
    initial = [ 1, [ 2, 3 ], [ 4, 5 ] ]
    assert_equal( expected, initial.flatten_it )   
  end
  
  def test_flattens_multiple_level_multidimensional_array
    initial = [ 1, [ 2, 3, [ 4, 5 ] ], 6, 7, [ 8, 9 ] ]
    expected = [ 1, 2, 3, 4, 5, 6, 7, 8 ,9 ]
    assert_equal( expected, initial.flatten_it )
  end

  def test_does_not_change_type
    assert_equal( Array, Array[ 1, 2, 3].flatten_it.class )
    assert_equal( MyArray, MyArray[ 1, 2, 3].flatten_it.class )
  end
  
  def test_does_not_modify_original 
    initial = [ 1, 2, [ 3, 4 ] ]
    initial.flatten_it
    assert_equal( [ 1, 2, [ 3, 4 ] ], initial )
  end
  
  # the following tests rely on 'test_does_not_modify_original'
  # to pass otherwise, we their results aren't valid, they could
  # be rewritten w/o that requirement but might make it harder
  # to comprehend if we made the tests more comprehensive 
  # ( e.g. test_does_not_flatten_arrays_in_non_array_types ) which could be
  # much more comprehensive
  
  def test_does_not_change_single_dimensional_array
    array = [ 1, 2, 3, 4 ]
    assert_equal( array, array.flatten_it )
  end
  
  def test_does_not_flatten_arrays_in_non_array_types
    initial = [ 1, { 1 => [ 1, 2 ] } ]
    assert_equal( initial, initial.flatten_it )
  end
end
