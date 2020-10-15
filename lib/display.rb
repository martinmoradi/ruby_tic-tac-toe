# frozen_string_literal: true

require_relative 'player'

class Display
  attr_accessor :canvas

  def initialize
    root = TkRoot.new
    root.title = 'Tic Tac Toe'
    root.minsize(600, 300)
    @canvas = TkCanvas.new(@root) do
      place('height' => 800, 'width' => 800)
    end

    # Line 1
    TkcLine.new(@canvas, 0, 100, 300, 100, 'width' => 2)
    # Line 2
    TkcLine.new(@canvas, 0, 200, 300, 200, 'width' => 2)
    # Column 1
    TkcLine.new(@canvas, 100, 0, 100, 300, 'width' => 2)
    # Column 2
    TkcLine.new(@canvas, 200, 0, 200, 300, 'width' => 2)
    # Column 3
    TkcLine.new(@canvas, 300, 0, 300, 300, 'width' => 2)

    text = TkText.new(root) do
      width 30
      height 20
      borderwidth 1
      font TkFont.new('comic-sans 12 bold')
      pack('side' => 'right', 'pady' => '5')
    end

    text.insert 'end', "Salut les moussaillons !\n\n Alors ce projet ? Une petite partie ? :D \n\nPlayer 1 : X\n\nPlayer 2 : O"
  end

  def cross(number)
    if number == 1
      TkcLine.new(@canvas, 15, 15, 85, 85, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 15, 85, 85, 15, 'width' => 4, 'fill' => 'blue')

    elsif number == 2
      TkcLine.new(@canvas, 115, 15, 185, 85, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 115, 85, 185, 15, 'width' => 4, 'fill' => 'blue')

    elsif number == 3
      TkcLine.new(@canvas, 215, 15, 285, 85, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 215, 85, 285, 15, 'width' => 4, 'fill' => 'blue')

    elsif number == 4
      TkcLine.new(@canvas, 15, 115, 85, 185, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 15, 185, 85, 115, 'width' => 4, 'fill' => 'blue')

    elsif number == 5
      TkcLine.new(@canvas, 115, 115, 185, 185, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 115, 185, 185, 115, 'width' => 4, 'fill' => 'blue')

    elsif number == 6
      TkcLine.new(@canvas, 215, 115, 285, 185, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 215, 185, 285, 115, 'width' => 4, 'fill' => 'blue')

    elsif number == 7
      TkcLine.new(@canvas, 15, 215, 85, 285, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 15, 285, 85, 215, 'width' => 4, 'fill' => 'blue')

    elsif number == 8
      TkcLine.new(@canvas, 115, 215, 185, 285, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 115, 285, 185, 215, 'width' => 4, 'fill' => 'blue')

    elsif number == 9
      TkcLine.new(@canvas, 215, 215, 285, 285, 'width' => 4, 'fill' => 'blue')
      TkcLine.new(@canvas, 215, 285, 285, 215, 'width' => 4, 'fill' => 'blue')

    end
  end

  def circle(number)
    if number == 1
      TkcOval.new(@canvas, 15, 85, 85, 15, 'width' => 4, 'outline' => 'red')

    elsif number == 2
      TkcOval.new(@canvas, 115, 85, 185, 15, 'width' => 4, 'outline' => 'red')

    elsif number == 3
      TkcOval.new(@canvas, 215, 85, 285, 15, 'width' => 4, 'outline' => 'red')

    elsif number == 4
      TkcOval.new(@canvas, 15, 185, 85, 115, 'width' => 4, 'outline' => 'red')

    elsif number == 5
      TkcOval.new(@canvas, 115, 185, 185, 115, 'width' => 4, 'outline' => 'red')

    elsif number == 6
      TkcOval.new(@canvas, 215, 185, 285, 115, 'width' => 4, 'outline' => 'red')

    elsif number == 7
      TkcOval.new(@canvas, 15, 285, 85, 215, 'width' => 4, 'outline' => 'red')

    elsif number == 8
      TkcOval.new(@canvas, 115, 285, 185, 215, 'width' => 4, 'outline' => 'red')

    elsif number == 9
      TkcOval.new(@canvas, 215, 285, 285, 215, 'width' => 4, 'outline' => 'red')

    end
  end
end
