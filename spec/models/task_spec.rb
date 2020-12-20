require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to have_many :notes }
  it { is_expected.to have_many :participating_users }
  it { is_expected.to belong_to(:owner) }
  it { is_expected.to belong_to(:category) }

  describe '#save' do
    context 'with params from scratch' do
      let(:owner) { create :user }
      let(:category) { create :category }
      let(:participant_1) { build :participant, :responsible }
      let(:participant_2) { build :participant, :follower }

      subject(:task) do
        described_class.new(
          name: 'task',
          description: 'our task',
          due_date: Date.today + 5.days,
          category: category,
          owner: owner,
          participating_users: [participant_1, participant_2]
        )
      end

      it 'is valid' do
        expect(task).to be_valid
        # is_expected.to be_valid
      end

      context 'after save' do
        before(:each) { task.save }

        it { is_expected.to be_persisted }

        it 'has a computed code' do
          expect(task.code).to be_present
        end
      end

      context 'with due_date in the past' do
        subject { task.tap { |t| t.due_date = Date.today - 5 } }

        it 'is invalid' do
          expect(subject).not_to be_valid
        end
      end
    end

    context 'with params from FactoryBot' do
      let(:participants_count) { 4 }
      subject(:task) { build(:task_with_participants, participants_count: participants_count) }

      it 'is persisted' do
        expect(task.save).to eq true
      end

      context 'after save' do
        before(:each) { task.save }

        it 'has all associated participants' do
          expect(task.participating_users.count).to eq participants_count
          expect(Participant.count).to eq participants_count
        end
      end
    end
  end
end