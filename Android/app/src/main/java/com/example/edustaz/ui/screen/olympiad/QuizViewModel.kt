package com.example.edustaz.ui.screen.olympiad

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateMapOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.example.edustaz.data.model.Question
import com.example.edustaz.data.remote.QuestionBank.getQuestions
import com.example.edustaz.data.remote.Subject

class QuizViewModel : ViewModel() {

    private var _subject: Subject = Subject.Math

    var questions by mutableStateOf(listOf<Question>())

    var currentQuestionIndex by mutableIntStateOf(0)
        private set

    val selectedAnswers = mutableStateMapOf<Int, Int>()

    fun selectAnswer(index: Int) {
        selectedAnswers[currentQuestionIndex] = index
    }

    fun nextQuestion() {
        if (currentQuestionIndex < questions.size - 1) {
            currentQuestionIndex++
        }
    }

    fun isLastQuestion(): Boolean = currentQuestionIndex == questions.lastIndex

    fun getScore(): Int {
        return questions.indices.count { i ->
            selectedAnswers[i] == questions[i].correctAnswerIndex
        }
    }

    fun setSubject(subject: Subject?) {
        if (subject != null) {
            _subject = subject
            questions = getQuestions(subject)
            currentQuestionIndex = 0
            selectedAnswers.clear()
        }
    }
}


