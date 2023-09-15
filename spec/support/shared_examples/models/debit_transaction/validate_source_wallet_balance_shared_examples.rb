# frozen_string_literal: true

RSpec.shared_examples "include DebitTransaction::ValidateSourceWalletBalance" do
  describe "DebitTransaction::ValidateSourceWalletBalance" do
    describe "Callbacks" do
      context "when prevent negative balance" do
        subject { transaction.save }

        let!(:wallet) { create :wallet }
        let(:transaction) { build :debit_transaction, source_wallet: wallet, amount: }

        before { create :credit_transaction, target_wallet: wallet, amount: 100 }

        context "when amount debit is greater than wallet balance" do
          let(:amount) { 101 }

          it { expect { subject }.not_to change(DebitTransaction, :count) }
          it { expect { subject }.not_to(change(wallet, :balance)) }
        end

        context "when amount debit is small than or equal to wallet balance" do
          let(:amount) { 100 }

          it { expect { subject }.to change(DebitTransaction, :count).by(1) }
          it { expect { subject }.to(change(wallet, :balance).by(-100)) }
        end
      end
    end
  end
end
