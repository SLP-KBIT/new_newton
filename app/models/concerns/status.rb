module Status
  NORMAL = 0
  BROKEN = 1
  LOST = 2

  TEXT = %w( 正常 破損 紛失 )

  def self.included(base)
    base.class_eval do
      validates :status, inclusion: { in: ( Status::NORMAL..Status::LOST ).to_a }

      def status_text
        TEXT[self.status]
      end
    end
  end

  def self.selection
    list = []
    TEXT.each_with_index { |text, i| list << [ text, i ] }
    list
  end
end
