import {Platform} from 'react-native';
import datePickerModuleAndroid from './nativeModules/datePickerModuleAndroid';
import datePickerModuleIos from './nativeModules/datePickerModuleIos';

const isIos = Platform.OS === 'ios';
export const datePicker = async (type: 'wheels' | 'compact' = 'wheels') => {
  const DatePickerModule = isIos
    ? datePickerModuleIos(type)
    : datePickerModuleAndroid();
  try {
    const date = await DatePickerModule;
    return date;
  } catch (error) {
    console.error(error);
  }
};
