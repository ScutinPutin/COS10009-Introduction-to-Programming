require 'rubygems'
require 'gosu'

# Instructions:  This code needs to be fixed and finished!
# The "Click Me" text is not appearing on the button, also
# the mouse_y co-ordinate should be shown along with the mouse_x one
# finally, a user has noticed the sometimes the button action occurs
# when you click out side the button area and vice-versa.


# determines whether a graphical widget is placed over others or not
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

# Global constants
WIN_WIDTH = 640
WIN_HEIGHT = 400

class DemoWindow < Gosu::Window

  # set up variables and attributes
  def initialize
    super(WIN_WIDTH, WIN_HEIGHT, false)
    @background = Gosu::Color::WHITE
    @button_font = Gosu::Font.new(20)
    @info_font = Gosu::Font.new(10)
    @locs = [60,60]
  end


  # Draw the background, the button with 'click me' text and text
  # showing the mouse coordinates
  def draw
    # Draw background color
    Gosu.draw_rect(0, 0, WIN_WIDTH, WIN_HEIGHT, @background, ZOrder::BACKGROUND, mode=:default)
    # Draw the button text
    @button_font.draw("Click me", 285, 165, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
    # Draw the button
    Gosu.draw_rect(270, 150, 100, 50, Gosu::Color::GREEN, ZOrder::MIDDLE, mode=:default)
    # Draw the mouse position information x
    @info_font.draw("mouse_x: #{@locs[0]}", 0, 350, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
    # Draw the mouse postion information y
    @info_font.draw("mouse_y: #{@locs[1]}", 0, 360, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
  end

  # this is called by Gosu to see if should show the cursor (or mouse)
  def needs_cursor?
    true
  end

  # If the button area (rectangle) has been clicked on change the background color
  # also store the mouse_x and mouse_y attributes that we 'inherit' from Gosu
  # you will learn about inheritance in the OOP unit - for now just accept that
  # these are available and filled with the latest x and y locations of the mouse click.

  def mouse_over_button(mouse_x, mouse_y)
    if ((mouse_x > 270 and mouse_x < 370) and (mouse_y > 150 and mouse_y < 200))
      true
    else
      false
    end
  end

  # Where is mouse_x and mouse_y defined

  def button_down(id)
    case id
    when Gosu::MsLeft
      @locs = [mouse_x, mouse_y]
      if mouse_over_button(mouse_x, mouse_y)
        @background = Gosu::Color::YELLOW
      else
        @background = Gosu::Color::WHITE
      end
    end
  end
end

# Lets get started!
DemoWindow.new.show
