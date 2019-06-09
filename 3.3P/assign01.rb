 require 'rubygems'
require 'gosu'
require './circle'

# The screen has layers: Background, middle, top
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
  end

  def draw
    draw_quad(0, 0, 0xff_ffffff, 640, 0, 0xff_ffffff, 0, 400, 0xff_ffffff, 640, 400, 0xff_ffffff, ZOrder::BACKGROUND)
    #draw_quad(5, 10, Gosu::Color::BLUE, 200, 10, Gosu::Color::AQUA, 5, 150, Gosu::Color::FUCHSIA, 200, 150, Gosu::Color::RED, ZOrder::MIDDLE)
    draw_quad(220, 150, Gosu::Color::BLUE, 420, 150, Gosu::Color::BLUE, 220, 300, Gosu::Color::BLUE, 420, 300, Gosu::Color::BLUE, ZOrder::MIDDLE)
    draw_triangle(180, 150, Gosu::Color::RED, 320, 40, Gosu::Color::RED, 460, 150, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
    draw_quad(230, 220, Gosu::Color::BLACK, 280, 220, Gosu::Color::BLACK, 230, 300, Gosu::Color::BLACK, 280, 300, Gosu::Color::BLACK, ZOrder::MIDDLE)
    draw_quad(320, 220, Gosu::Color::BLACK, 400, 220, Gosu::Color::BLACK, 320, 270, Gosu::Color::BLACK, 400, 270, Gosu::Color::BLACK, ZOrder::MIDDLE)
    draw_quad(320, 160, Gosu::Color::BLACK, 400, 160, Gosu::Color::BLACK, 320, 200, Gosu::Color::BLACK, 400, 200, Gosu::Color::BLACK, ZOrder::MIDDLE)
    draw_quad(230, 160, Gosu::Color::BLACK, 300, 160, Gosu::Color::BLACK, 230, 200, Gosu::Color::BLACK, 300, 200, Gosu::Color::BLACK, ZOrder::MIDDLE)



    draw_quad(0, 0, Gosu::Color::YELLOW, 100, 0, Gosu::Color::YELLOW, 0, 100, Gosu::Color::YELLOW, 100, 100, Gosu::Color::YELLOW, ZOrder::MIDDLE)
    draw_quad(0, 300, Gosu::Color::GREEN, 640, 300, Gosu::Color::GREEN, 0, 640, Gosu::Color::GREEN, 640, 400, Gosu::Color::GREEN, ZOrder::MIDDLE)


end
end

DemoWindow.new.show
