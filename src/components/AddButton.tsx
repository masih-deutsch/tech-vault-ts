"use client";

import { PackagePlus } from 'lucide-react';
import { setModalStatus, setNewEntryStatus, setPassModalStatus, setPendingAction, useLibStore } from './useLibStore';



export default function AddButton() {

  const myPass = useLibStore(s => s.myPass);

  function handleAdd() {

    const addLogic = () => {
      setModalStatus(true);
      setNewEntryStatus(true);
    };

    if (!myPass) {
      setPendingAction(addLogic);
      setPassModalStatus(true);
    } else {
      addLogic();
    }

  }


  return (
    <div className='w-full sm:w-auto'>
      <button onClick={handleAdd}
        className='flex bg-cyan-600 text-white px-8 py-4 rounded-xl hover:bg-cyan-500 transition duration-300 ease-in shadow-lg shadow-cyan-500/40 cursor-pointer'>
        <PackagePlus />Add New Library
      </button>
    </div>
  );
}


