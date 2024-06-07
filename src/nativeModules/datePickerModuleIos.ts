import {NativeModules} from 'react-native';

const {DatePickerModule} = NativeModules;

const showDatePicker = async (style: 'wheels' | 'compact' = 'wheels') => {
  return await new Promise((resolve, reject) => {
    DatePickerModule.showDatePicker(style, (dateString: any) => {
      if (dateString) {
        resolve(dateString);
      } else {
        reject('Date not selected');
      }
    });
  });
};

export default showDatePicker;
