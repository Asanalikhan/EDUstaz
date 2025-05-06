package com.example.edustaz.ui.screen.olympiad

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateMapOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.example.edustaz.data.model.Question

class QuizViewModel : ViewModel() {

    private val _questions = listOf(
        Question(
            text = "Елші Долгов арқылы Орынбор генерал-губернаторына жолдаған хатында...",
            options = listOf(
                "Империялық қысымды тоқтату",
                "Салықты көбейту",
                "Орысша оқыту",
                "Қару алып жүруге рұқсат"
            ),
            correctAnswerIndex = 0
        ),
        Question(
            text = "Қазақ хандығының негізін қалаушылар?",
            options = listOf(
                "Абылай мен Бөгенбай",
                "Жәнібек пен Керей",
                "Есім мен Тәуке",
                "Қасым мен Хақназар"
            ),
            correctAnswerIndex = 1
        ),
        Question(
            text = "Алаш қозғалысының мақсаты:",
            options = listOf(
                "Тәуелсіз Қазақ мемлекетін құру",
                "Кеңес үкіметін қолдау",
                "Жерді мемлекеттен алу",
                "Сауда қатынастарын нығайту"
            ),
            correctAnswerIndex = 0
        )
        // Continue until you reach 50...
    )

    var currentQuestionIndex by mutableIntStateOf(0)
        private set

    val questions: List<Question> get() = _questions

    var selectedAnswers = mutableStateMapOf<Int, Int>()
        private set

    fun selectAnswer(index: Int) {
        selectedAnswers[currentQuestionIndex] = index
    }

    fun nextQuestion() {
        if (currentQuestionIndex < questions.lastIndex) {
            currentQuestionIndex++
        }
    }

    fun isLastQuestion(): Boolean = currentQuestionIndex == _questions.lastIndex

    fun getScore(): Int {
        return _questions.indices.count { i ->
            selectedAnswers[i] == _questions[i].correctAnswerIndex
        }
    }
}

