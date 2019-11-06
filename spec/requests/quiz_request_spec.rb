require 'rails_helper'

RSpec.describe 'Quizzes API', type: :request do
  let!(:quizzes) { create_list(:quiz, 5) }
  let(:quiz_id) { quizzes.first.id }

  describe 'GET /quizzes' do
    before { get '/quizzes.json' }

    it 'returns quizzes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /quizzes' do
    let(:valid_attributes) {
      {
        quiz: {
          id: 21,
          name: Faker::Lorem.word,
          questions: [
            {
              id: 1,
              content: Faker::Lorem.sentence,
              choices: [
                {
                  id: 1,
                  content: Faker::Lorem.sentence,
                  correct: false
                },
                {
                  id: 2,
                  content: Faker::Lorem.sentence,
                  correct: true
                }
              ]
            },
            {
              id: 2,
              content: Faker::Lorem.sentence,
              choices: [
                {
                  id: 3,
                  content: Faker::Lorem.sentence,
                  correct: true
                },
                {
                  id: 4,
                  content: Faker::Lorem.sentence,
                  correct: false
                }
              ]
            }
          ]
        }
      }
    }

    let(:invalid_attributes) {
      {
        quiz: {
          name: '',
          questions: [
            {
              content: '',
              choices: [
                content: ''
              ]
            }
          ]
        }
      }
    }

    context 'when quiz is successfully created' do
      before { post "/quizzes.json", params: valid_attributes }
      it 'creates a quiz' do
        expect(json[:name]).to eq(valid_attributes[:quiz][:name])
        expect(json[:id]).not_to eq(nil)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when quiz is unsuccessfully created' do
      before { post "/quizzes.json", params: invalid_attributes }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'when request is invalid' do
      before { post "/quizzes", params: invalid_attributes }
      it 'renders create quiz page' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /quizzes/:id' do
    context 'when quiz exists' do
      before { get "/quizzes/#{quiz_id}.json" }
      it 'returns a status code of 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the quiz' do
        expect(json).not_to be_empty
        expect(json[:id]).to eq(quiz_id)
        expect(json[:name]).to eq(quizzes.first.name)
      end
    end
  end

  describe 'PUT /quizzez/:id' do
    let(:valid_attributes) { { quiz: { name: Faker::Lorem.word} } }

    context 'when the quiz exists' do
      before { put "/quizzes/#{quiz_id}.json", params: valid_attributes }

      it 'updates the quiz' do
        expect(json[:name]).to eq(valid_attributes[:quiz][:name])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
