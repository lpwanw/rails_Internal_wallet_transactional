# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe ".has_secure_password" do
    it { is_expected.to have_secure_password }
  end

  describe "Callbacks" do
    describe "#downcase_email" do
      subject { user.save }

      let(:user) { build :user, email: }
      let(:email) { "TEST@EXAMPLE.COM" }

      before { subject }

      it { expect(user.email).to eq "test@example.com" }
    end
  end

  describe "Validations" do
    subject { user }

    let(:user) { build :user }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    # valid email

    it { is_expected.to allow_value("test@example.com").for(:email) }
    it { is_expected.to allow_value("user.name+tag@example.co.uk").for(:email) }

    # invalid email

    it { is_expected.not_to allow_value("invalid_email").for(:email) }
    it { is_expected.not_to allow_value("test@").for(:email) }
    it { is_expected.not_to allow_value("@example.com").for(:email) }

    it "is valid with a matching password and password confirmation" do
      user.password = "new_password"
      user.password_confirmation = "new_password"
      expect(user).to be_valid
    end

    it "is not valid with a unmatching password and password confirmation" do
      user.password = "new_password"
      user.password_confirmation = "new_password_ss"
      expect(user.errors.of_kind?(:password, :confirmation)).to be false
    end

    context "when validate password" do
      let(:user) { build :user, password: }

      context "when password is blank" do
        let(:password) { "" }

        it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
      end

      context "when password is not blank & not present" do
        let(:password) { nil }

        it "does not validate the length of password" do
          user.valid?
          expect(user.errors.of_kind?(:password, :too_short)).not_to be true
        end
      end
    end
  end
end
