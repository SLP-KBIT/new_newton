module Category
  OTHERS = 0
  PC = 1
  CAMERA = 2

  TEXT = %w( その他 パソコン関係 カメラ関係 )

  def self.included(base)
    base.class_eval do
      validates :category, inclusion: { in: ( Category::OTHERS..Category::CAMERA ).to_a }

      def category_text
        TEXT[self.category]
      end
    end
  end

  def self.selection
    list = []
    TEXT.each_with_index { |text, i| list << [ text, i ] }
    list
  end
end
