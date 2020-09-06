using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using ModelLayer.Business;
using ModelLayer.Data;
using WpfClubFromageVM.viewModel;

namespace WpfClubFromage.viewModel
{
    class viewModelFromage : viewModelBase
    {
        private ObservableCollection<Pays> listPays;
        private ObservableCollection<Fromage> listFromages;

        private Fromage selectedFromage = new Fromage();
        private Fromage toUpdateFromage = new Fromage();
        private Fromage activeFromage = new Fromage();

        private ICommand updateCommand;

        private DaoPays vmDaoPays;
        private DaoFromage vmDaoFromage;

        public ObservableCollection<Pays> ListPays { get => listPays; set => listPays = value; }
        public ObservableCollection<Fromage> ListFromages 
        { 
            get => listFromages;
            set
            {
                listFromages = value;               
            }
        }
        public Fromage SelectedFromage 
        { 
            get => selectedFromage;
            set
            {
                if (selectedFromage != value)
                {
                    selectedFromage = value;
                    OnPropertyChanged("SelectedFromage");

                    if (SelectedFromage != null)
                        ActiveFromage = SelectedFromage;

                }                
            }
        }

        public Fromage ToUpdateFromage 
        { 
            get => toUpdateFromage;
            set
            {
                toUpdateFromage = value;
                //OnPropertyChanged("ToUpdateFromage");
                //OnPropertyChanged("Name");
                //OnPropertyChanged("Creation");
            }
        }

        public Fromage ActiveFromage 
        {
            get => activeFromage;
            set
            {
                if (activeFromage != value)
                {
                    activeFromage = value;
                    OnPropertyChanged("Name");
                    OnPropertyChanged("Origin");
                    OnPropertyChanged("Creation");
                }
            }
        }

        public string Name 
        { 
            get => ActiveFromage.Name;
            set
            {
                if (ActiveFromage.Name != value)
                {
                    ActiveFromage.Name = value;
                    OnPropertyChanged("Name");
                }
            }
        }

        public Pays Origin
        {
            get
            {
                if (ActiveFromage != null)
                {
                    return SelectedFromage.Origin;
                }
                else
                    return null;               
            }
            set
            {
                if (ActiveFromage.Origin != value)
                {
                    ActiveFromage.Origin = value;
                    OnPropertyChanged("Origin");
                }
            }
        }

        public DateTime Creation
        {
            get => ActiveFromage.Creation;
            set
            {
                if (ActiveFromage.Creation != value)
                {
                    ActiveFromage.Creation = value;
                    OnPropertyChanged("Creation");
                }
            }
        }
        public ICommand UpdateCommand 
        {
            get
            {
                if (this.updateCommand == null)
                {
                    this.updateCommand = new RelayCommand(() => UpdateFromage(), () => true);
                }
                return this.updateCommand;
               
            }
         
        }


        public viewModelFromage(DaoPays thedaopays, DaoFromage thedaofromage)
        {
            vmDaoPays = thedaopays;
            vmDaoFromage = thedaofromage;

            listPays = new ObservableCollection<Pays>(thedaopays.SelectAll());
            listFromages = new ObservableCollection<Fromage>(thedaofromage.SelectAll());

        }

        private void UpdateFromage()
        {

            ToUpdateFromage = ActiveFromage;
            this.vmDaoFromage.Update(ToUpdateFromage);
            var i = listFromages.IndexOf(ToUpdateFromage);           
            listFromages.RemoveAt(i);
            listFromages.Insert(i, ToUpdateFromage);
            SelectedFromage = ToUpdateFromage;
            
            
        }
    }
}
