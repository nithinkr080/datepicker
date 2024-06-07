/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {Button, SafeAreaView} from 'react-native';

import {datePicker} from './src/datePickerModule';

function App(): React.JSX.Element {
  const showDatePicker = async () => {
    const date = await datePicker();
    console.log(date);
  };

  return (
    <SafeAreaView>
      <Button title="Show Date Picker" onPress={showDatePicker} />
    </SafeAreaView>
  );
}

export default App;
