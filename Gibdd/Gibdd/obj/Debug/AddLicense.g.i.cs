#pragma checksum "..\..\AddLicense.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "8C45CED31EB83FE33EF372B3F9F859DFF03EE61E9074344D5E89EF20932B2B9D"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Gibdd;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Gibdd {
    
    
    /// <summary>
    /// AddLicense
    /// </summary>
    public partial class AddLicense : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 24 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker DateFirst;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker DateLast;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox SerT;
        
        #line default
        #line hidden
        
        
        #line 27 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox NumT;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox DriverT;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox StatusCmb;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox CategoryCmb;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\AddLicense.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddLicenseBtn;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Gibdd;component/addlicense.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\AddLicense.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.DateFirst = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 2:
            this.DateLast = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 3:
            this.SerT = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.NumT = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.DriverT = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.StatusCmb = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 7:
            this.CategoryCmb = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 8:
            this.AddLicenseBtn = ((System.Windows.Controls.Button)(target));
            
            #line 38 "..\..\AddLicense.xaml"
            this.AddLicenseBtn.Click += new System.Windows.RoutedEventHandler(this.AddLicense_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

