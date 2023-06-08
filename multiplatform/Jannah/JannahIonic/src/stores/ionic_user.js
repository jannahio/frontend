import { Drivers, Storage } from '@ionic/storage';


export const useIonicUserStore = new Storage({
  name: 'ionic_user_db',
  driverOrder: [Drivers.IndexedDB, Drivers.LocalStorage]
});


//export useIonicUserStore;
