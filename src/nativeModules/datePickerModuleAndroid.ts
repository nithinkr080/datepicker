import {NativeModules} from 'react-native';

const {DatePickerModule} = NativeModules;

const showDatePicker = async () => {
  return await DatePickerModule.showDatePicker();
};
export default showDatePicker;
