# frozen_string_literal: true

module CustomCops
  class NoDirectTransactionUsage < RuboCop::Cop::Base
    MSG = "Do not use Transaction class directly. Use its subclasses instead."

    def on_const(node)
      return unless node.source == "Transaction"

      add_offense(node, message: MSG)
    end
  end
end
