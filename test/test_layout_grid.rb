require 'helper'
require 'pubcloud/layout_grid'

class TestLayoutGrid < Test::Unit::TestCase
  def test_zero
    grid = LayoutGrid.new(width=0, height=0)
    assert_equal("<table></table>", grid.to_html)
  end

  def test_two_by_two
    grid = LayoutGrid.new(width=2, height=2)
    exp = "<table>#{tr(td("&nbsp;")*2)*2}</table>"
    assert_equal(exp, grid.to_html)
  end
  
  def test_add_multi_row_multi_col
    grid = LayoutGrid.new(width=5, height=2)
    plum = GridBlock.new(Token.new("plum"), font_size=1.0)
    assert_equal(4, plum.colspan)
    assert_equal(1, plum.rowspan)
    grid.add!(plum,0,0)

    exp = "<table>#{tr("<td colspan=4 rowspan=1>plum</td><td>&nbsp;</td>")}#{tr(td("&nbsp;")*5)}</table>"
    assert_equal(exp, grid.to_html)
  end
  
  def tr(str)
    "<tr>#{str}</tr>"
  end
  
  def td(str)
    "<td>#{str}</td>"
  end
  
end