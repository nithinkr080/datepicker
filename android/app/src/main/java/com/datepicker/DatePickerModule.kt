package com.datepicker

import android.app.DatePickerDialog
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import java.util.Calendar

class DatePickerModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    private var datePromise: Promise? = null

    override fun getName(): String {
        return "DatePickerModule"
    }

    @ReactMethod
    fun showDatePicker(promise: Promise) {
        datePromise = promise

        val c = Calendar.getInstance()
        val year = c.get(Calendar.YEAR)
        val month = c.get(Calendar.MONTH)
        val day = c.get(Calendar.DAY_OF_MONTH)

        val datePickerDialog = DatePickerDialog(currentActivity!!,
            { _, year, monthOfYear, dayOfMonth ->
                val selectedDate = "$year-${monthOfYear + 1}-$dayOfMonth"
                datePromise?.resolve(selectedDate)
            }, year, month, day)
        datePickerDialog.show()
    }
}
