using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CP
/// </summary>
public class CP
{
    private static readonly string _connectionString;

    private int _id;
    private string _name;
    private bool _isFeatured;
    private decimal _price;
    private string _description;
    private string _fullDescription;
    private bool _hasImage;
    private int _categoryId;
    private string _categoryTitle;
    private string _imageAltText;


    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }

    public bool IsFeatured
    {
        get { return _isFeatured; }
        set { _isFeatured = value; }
    }


    public decimal Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }

    public string FullDescription
    {
        get { return _fullDescription; }
        set { _fullDescription = value; }
    }

    public bool HasImage
    {
        get { return _hasImage; }
    }


    public string ImageAltText
    {
        get { return _imageAltText; }
        set { _imageAltText = value; }
    }


    public int CategoryId
    {
        get { return _categoryId; }
        set { _categoryId = value; }
    }

    public string CategoryTitle
    {
        get { return _categoryTitle; }
        set { _categoryTitle = value; }
    }
	public CP()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}