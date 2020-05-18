using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.Caching;

namespace ShoppingCart
{

    /// <summary>
    /// Uses AJAX to retrieve and display random content items
    /// from an XML file
    /// </summary>
    public class AjaxRotator : WebControl, ICallbackEventHandler
    {
        const string scriptPath = "~/ClientScripts/AjaxRotator.js";
        private string _contentPath = "~/AjaxRotatorContent.config";

        /// <summary>
        /// The path to the XML file
        /// </summary>
        public string ContentPath
        {
            get { return _contentPath; }
            set { _contentPath = value; }
        }

        /// <summary>
        /// Wire-up the JavaScript
        /// </summary>
        protected override void OnPreRender(EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptInclude("AjaxRotator", ResolveUrl(scriptPath));
            string clientContext = String.Format("'{0}'", ClientID);
            string callback = Page.ClientScript.GetCallbackEventReference(this, null, "AjaxRotator_Update", clientContext,"AjaxRotator_Error", false);
            string startupScript = String.Format("setInterval( \"{0}\", 15000 )", callback);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "AjaxRotator", startupScript, true);
            base.OnPreRender(e);
        }

        /// <summary>
        /// Display initial content before the AJAX call happens
        /// </summary>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            writer.Write(GetRandomContent());
        }

        /// <summary>
        /// Render content in a DIV tag
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get
            {
                return HtmlTextWriterTag.Div;
            }
        }

        /// <summary>
        /// Required by ICallbackEventHandler interface
        /// </summary>
        public void RaiseCallbackEvent(string eventArgument)
        {
        }

        /// <summary>
        /// Return random content as response to
        /// an AJAX call
        /// </summary>
        public string GetCallbackResult()
        {
            return GetRandomContent();
        }

        /// <summary>
        /// Retrieve the random content from the XML file
        /// </summary>
        private string GetRandomContent()
        {
            // Get XML document
            XmlDocument xml = (XmlDocument)Context.Cache["AjaxRotator"];
            if (xml == null)
            {
                string physicalContentPath = Context.Server.MapPath(_contentPath);
                xml = new XmlDocument();
                xml.Load(physicalContentPath);
                CacheDependency fileDepend = new CacheDependency(physicalContentPath);
                Context.Cache.Insert("AjaxRotator", xml, fileDepend);
            }

            // Randomly pick an item
            Random rnd = new Random();
            int index = rnd.Next(xml.DocumentElement.ChildNodes.Count);
            XmlNode node = xml.DocumentElement.ChildNodes[index];
            return node.InnerXml;
        }


    }
}